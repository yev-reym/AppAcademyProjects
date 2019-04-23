require_relative 'requirements'

class Reply
    attr_accessor :id, :user_id, :question_id, :parent_id

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM replies")
        data.map {|datum| Reply.new(datum)}
    end

    def self.find_by_id(wanted_id)
        data = QuestionsDatabase.instance.execute(<<-SQL, wanted_id)
            SELECT
            *
            FROM
            replies
            WHERE
            id = ? 
        SQL

        return Reply.new(data.first) unless data.empty?
        raise Exception.new('This id does not exist!')
    end

    def self.find_by_user_id(user_id)
        data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
            SELECT
            *
            FROM
            replies
            WHERE
            user_id = ? 
        SQL
        raise Exception.new('This id does not exist!') if data.empty?
        data.map {|datum| Reply.new(datum)} 
    end

    def self.find_by_question_id(question_id)
        data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT
            *
            FROM
            replies
            WHERE
            question_id = ? 
        SQL
        raise Exception.new('This id does not exist!') if data.empty?
        data.map {|datum| Reply.new(datum)} 
    end

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
        @parent_id = options['parent_id']
    end

    def author
        data = QuestionsDatabase.instance.execute(<<-SQL, self.user_id)
            SELECT
            *
            FROM
            users
            WHERE
            users.id = ? 
        SQL

        raise Exception.new('This entry does not exist!') if data.empty?
        User.new(data.first) 
    end

    def question
        data = QuestionsDatabase.instance.execute(<<-SQL, self.question_id)
            SELECT
            *
            FROM
            questions
            WHERE
            questions.id = ? 
        SQL

        raise Exception.new('This entry does not exist!') if data.empty?
        Question.new(data.first) 
    end

    def parent_reply
        data = QuestionsDatabase.instance.execute(<<-SQL, self.parent_id)
            SELECT
            *
            FROM
            replies
            WHERE
            replies.id = ? 
        SQL

        raise Exception.new('This entry does not exist!') if data.empty?
        Reply.new(data.first) 
    end

    def child_reply
        data = QuestionsDatabase.instance.execute(<<-SQL, self.id)
            SELECT
            *
            FROM
            replies
            WHERE
            replies.parent_id = ? 
        SQL

        raise Exception.new('This entry does not exist!') if data.empty?
        Reply.new(data.first) 
    end

    def save
        if self.id
            data = QuestionsDatabase.instance.execute(<<-SQL, self.body, self.question_id, self.parent_id, self.user_id, self.id)
                UPDATE
                    replies
                SET
                    body = ?, question_id = ?, parent_id = ?, user_id = ?
                WHERE
                    id = ?
            SQL
        else
            data = QuestionsDatabase.instance.execute(<<-SQL, self.body, self.question_id, self.parent_id, self.user_id)
                INSERT INTO
                    replies (body, question_id, parent_id, user_id)
                VALUES
                    (?,?,?,?)
            SQL

            self.id = QuestionsDatabase.instance.last_insert_row_id
        end
    end
end
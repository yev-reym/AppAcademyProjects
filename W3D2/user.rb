require_relative 'requirements'

class User
    attr_accessor :id, :fname, :lname

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM users")
        data.map {|datum| User.new(datum)}
    end

    def self.find_by_id(wanted_id)


        data = QuestionsDatabase.instance.execute(<<-SQL, wanted_id)
            SELECT
            *
            FROM
            users
            WHERE
            id = ? 
        SQL

        return User.new(data.first) unless data.empty?
        raise Exception.new('This id does not exist!')
    end

    def self.find_by_name(fname, lname)
        data = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
            SELECT
            *
            FROM
            users
            WHERE
            users.fname = ? AND users.lname = ?
        SQL

        raise Exception.new('This id does not exist!') if data.empty?
        User.new(data.first) 
    end
    

    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end

    def authored_questions
        Question.find_by_author_id(self.id) 
    end

    def authored_replies
        Reply.find_by_user_id(self.id)
    end

    def followed_questions
        QuestionFollow.followed_questions_for_user_id(self.id)
    end 

    def liked_questions
        QuestionLike.liked_questions_for_user_id(self.id)
    end

    def average_karma
        QuestionsDatabase.instance.execute(<<-SQL, self.id)
            SELECT
            CAST(COUNT(question_likes.id) AS float) / COUNT(DISTINCT(questions.id))
            FROM
            users
            JOIN questions ON users.id = questions.user_id
            JOIN question_likes ON questions.id = question_likes.question_id

            WHERE
            users.id = ?
        SQL
    end

    def save
        if self.id
            data = QuestionsDatabase.instance.execute(<<-SQL, self.fname, self.lname, self.id)
                UPDATE
                    users
                SET
                    fname = ?, lname = ?
                WHERE
                    id = ?
            SQL
        else
            data = QuestionsDatabase.instance.execute(<<-SQL, self.fname, self.lname)
                INSERT INTO
                    users (fname, lname)
                VALUES
                    (?,?)
            SQL

            self.id = QuestionsDatabase.instance.last_insert_row_id
        end
    end
end
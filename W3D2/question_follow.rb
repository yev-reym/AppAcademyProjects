require_relative 'requirements'

class QuestionFollow
    attr_accessor :id, :user_id, :question_id

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM question_follows")
        data.map {|datum| QuestionFollow.new(datum)}
    end

    def self.find_by_id(wanted_id)
        data = QuestionsDatabase.instance.execute(<<-SQL, wanted_id)
            SELECT
            *
            FROM
            question_follows
            WHERE
            id = ? 
        SQL

        return QuestionFollow.new(data.first) unless data.empty?
        raise Exception.new('This id does not exist!')
    end

    def self.followers_for_question_id(question_id)
        data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT
            users.id, users.fname, users.lname
            FROM
            users
            JOIN
                question_follows ON question_follows.user_id = users.id
            WHERE
            question_follows.question_id = ? 
        SQL

        raise Exception.new('Invalid question id') if data.empty?
        data.map {|datum| User.new(datum)}
    end

    def self.followed_questions_for_user_id(user_id)
         data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
            SELECT
            questions.id, questions.title, questions.body, questions.user_id
            FROM
            questions
            JOIN
            question_follows ON question_follows.question_id = questions.id
            WHERE
            question_follows.user_id = ? 
        SQL

        raise Exception.new('Invalid question id') if data.empty?
        data.map {|datum| Question.new(datum)}
    end

    def self.most_followed_questions(n)
        data = QuestionsDatabase.instance.execute(<<-SQL, n)
            SELECT
            questions.id, questions.title, questions.body, questions.user_id, COUNT(questions.id) AS followers
            FROM
            question_follows
            LEFT JOIN
                questions ON question_follows.question_id = questions.id
            GROUP BY
            questions.id
            ORDER BY 
            COUNT(questions.id) DESC
            LIMIT ?
        SQL
        raise Exception.new('Invalid') if data.empty?
        data.map {|datum| Question.new(datum)}
    end

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
    end
end
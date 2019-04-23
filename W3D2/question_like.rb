require_relative 'requirements'

class QuestionLike
    attr_accessor :id, :user_id, :question_id

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM question_likes")
        data.map {|datum| QuestionLike.new(datum)}
    end

    def self.find_by_id(wanted_id)
        data = QuestionsDatabase.instance.execute(<<-SQL, wanted_id)
            SELECT
            *
            FROM
            question_likes
            WHERE
            id = ? 
        SQL

        return QuestionLike.new(data.first) unless data.empty?
        raise Exception.new('This id does not exist!')
    end

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
    end

    def self.likers_for_question_id(question_id)
        data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT
            users.id,users.fname,users.lname
            FROM
            users
            JOIN
            question_likes ON question_likes.user_id = users.id
            WHERE
            question_likes.question_id = ? 
        SQL

        return data.map {|datum| User.new(datum)} unless data.empty?
        raise Exception.new('This id does not exist!')
    end

    def self.num_likes_for_question_id(question_id)
        data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT
            COUNT(*) AS likes
            FROM
            users
            JOIN
            question_likes ON question_likes.user_id = users.id
            WHERE
            question_likes.question_id = ? 
        SQL
    end

    def self.liked_questions_for_user_id(user_id)
        data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
            SELECT
            questions.id,questions.title,questions.body,questions.user_id
            FROM
            questions
            JOIN
            question_likes ON question_likes.question_id = questions.id
            WHERE
            question_likes.user_id = ? 
        SQL

        return data.map {|datum| Question.new(datum)} unless data.empty?
        raise Exception.new('This id does not exist!')
    end

    def self.most_liked_questions(n)
        data = QuestionsDatabase.instance.execute(<<-SQL, n)
            SELECT
            questions.id, questions.title, questions.body, questions.user_id, COUNT(questions.id) AS followers
            FROM
            question_likes
            LEFT JOIN
                questions ON question_likes.question_id = questions.id
            GROUP BY
            questions.id
            ORDER BY 
            COUNT(questions.id) DESC
            LIMIT ?
        SQL
        raise Exception.new('Invalid') if data.empty?
        data.map {|datum| Question.new(datum)}
    end

    
end
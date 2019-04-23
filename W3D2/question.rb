require 'sqlite3'
require 'singleton'
require_relative 'requirements'

class QuestionsDatabase < SQLite3::Database
    include Singleton

    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end
end

class Question
    attr_accessor :id, :title, :body, :user_id

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
        data.map {|datum| Question.new(datum)}
    end

    def self.find_by_id(wanted_id)


        data = QuestionsDatabase.instance.execute(<<-SQL, wanted_id)
            SELECT
            *
            FROM
            questions
            WHERE
            id = ? 
        SQL

        return Question.new(data.first) unless data.empty?
        raise Exception.new('This id does not exist!')
    end

    def self.find_by_author_id(author_id)
        data = QuestionsDatabase.instance.execute(<<-SQL, author_id)
            SELECT
            *
            FROM
            questions
            WHERE
            user_id = ? 
        SQL

        raise Exception.new('This entry does not exist!') if data.empty?
        data.map {|datum| Question.new(datum)} 
    end

    def self.most_liked(n)
        QuestionLike.most_liked_questions(n)
    end

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @user_id = options['user_id']
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

    def replies
        Reply.find_by_question_id(self.id)
    end

    def followers
        QuestionFollow.followers_for_question_id(self.id)
    end

    def self.most_followed(n)
        QuestionFollow.most_followed_questions(n)
    end

    def likers
        QuestionLike.likers_for_question_id(self.id)
    end

    def num_likes
        QuestionLike.num_likes_for_question_id(self.id)
    end

    def save
        if self.id
            data = QuestionsDatabase.instance.execute(<<-SQL, self.title, self.body, self.user_id, self.id)
                UPDATE
                    questions
                SET
                    title = ?, body = ?, user_id = ?
                WHERE
                    id = ?
            SQL
        else
            data = QuestionsDatabase.instance.execute(<<-SQL, self.title, self.body, self.user_id)
                INSERT INTO
                    questions (title, body, user_id)
                VALUES
                    (?,?,?)
            SQL

            self.id = QuestionsDatabase.instance.last_insert_row_id
        end
    end
    
end
class QuestionsController < ApplicationController
  def question_1
    # How many movies are in the database?

    # Your Ruby goes here.

    @number_of_movies = Movie.count
  end

  def question_2
    # In what year was the oldest movie on the list released?

    # Your Ruby goes here.

    @movie_year = Movie.order("year DESC")

    @year_of_oldest_movie = @movie_year.last.year


  end

  def question_3
    # How many movies does the director of the first movie have on the list?

      @director = Director.find(Movie.first.director_id)
      @directors_movies = Movie.where(:director_id => @director.id)

      @number_of_movies_directed_by_first_movie_director = @directors_movies.count

  end

  def question_4
    # What is the most number of movies any single director has on the list?

    # Your Ruby goes here.
    # You'll probably have to use both ActiveRecord query methods as well as some plain old Ruby logic.

  movie_counts = []

  Director.all.each do |the_director|
     the_directors_movies = Movie.where(:director_id => the_director.id)
     number_of_movies_directed_by_the_director = the_directors_movies.count

      movie_counts.push(number_of_movies_directed_by_the_director)
 end

     @most_number_of_movies_by_a_single_director = movie_counts.max

  end

  def question_5
    # What is the most recent movie on the list that the first actor appeared in?

    # Your Ruby goes here.
    # You'll probably have to use both ActiveRecord query methods as well as some plain old Ruby logic.

    @first_actor = Actor.first
    @the_actor_roles = Role.where(:actor_id => @first_actor.id)

    @the_actor_movies = []

    @the_actor_roles.each do |the_role|
    the_actors_movies.push = Movie.find(the_role.movie_id))
  end

most_recent_year = 0

    @the_actor_movies.each do |the_movie|
      if the_movie.year.to_i > most_recent_year
          most_recent_year = the_movie.year.to_i
        end
      end

    @most_recent_movie_for_first_actor = most_recent_year
  end
end



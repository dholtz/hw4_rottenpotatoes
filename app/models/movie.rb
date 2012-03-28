class Movie < ActiveRecord::Base

  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end

  def self.similar_movies(mov_id)
    movie = Movie.find mov_id
    movies = Movie.find_all_by_director(movie.director)
    movies.delete(movie)
    {:searched_for_mov => movie, :found_movies => movies}
  end
end

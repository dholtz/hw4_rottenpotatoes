Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    #a_movie = Movie.new(:title => movie["title"], :rating => movie["rating"], , :director =>["director"], :release_date => movie["release_date"])
    #a_movie.create
    Movie.create!(movie)
  end
end

Then /^the director of "(.*)" should be "(.*)"$/ do |mov, dir|
  saved_mov = Movie.find_by_title(mov)
  assert dir.eql? saved_mov.director
end

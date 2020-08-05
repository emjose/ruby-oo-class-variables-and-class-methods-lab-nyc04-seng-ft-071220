# In this lab, we'll be dealing with a Song class. The Song class can produce individual songs. 
# Each song has a name, an artist and a genre. 


class Song
    
    ## We need our Song class to be able to keep track of the number of songs that it creates (Song.count)
    # We need our Song class to be able to show us all of the artists of existing songs (Song.artists):
    # We need our Song class to be able to show us all of the genres of existing songs (Song.genres):

    # We also need our Song class to be able to keep track of the number of songs of each genre it creates.
    # In other words, calling: Song.genre_count

    @@count = 0
    @@artists = []
    @@genres = []

    # Define your Song class such that an individual song is initialized with a name, artist and genre.
    # There should be an attr_accessor for those three attributes.

    # Create a class variable, @@count. We will use this variable to keep track of the number of new songs 
    # that are created from the Song class. Set this variable equal to 0.

    # Whenever a new song is created. 
    # Your #initialize method should use the @@count variable and increment the value of that variable by 1.

    attr_accessor :name, :artist, :genre
  
    def initialize(name, artist, genre)
      @name = name
      @artist = artist
      @genre = genre
      @@count +=1
      @@genres << genre
      @@artists << artist
    end
  
    # Write a class method, .count, that returns the total number of songs created.
    def self.count
      @@count
    end
  
    #Write a class method, .artists, that returns an array of all of the artists of the existing songs. 
    # This array should only contain unique artists––no repeats! 
    #Once again think about what you need to do to implement this behavior.

        # You'll need a class variable, let's call it @@artists, that is equal to an empty array.
        # When should you add artists to this array? 
        # Whenever a new song is intialized. 
        # Your #initialize method should add artists to the @@artists array. 
        # All artists should be added to the array. 
        # Control for duplicates when you code your .artists class method, 
        # not when you add artists to the original @@artists array. 
        # We will want to know how many songs each have been assigned to each artist. 
        # We'll revisit that job a little later on when we write our .artist_count method.

    def self.artists
      @@artists.uniq #this class method is accessed by the class variable @@artists
    end
  
    # Write a class method, .genres that returns an array of all of the genres of existing songs. 
    # This array should contain only unique genres––no duplicates! 
    # Think about what you'll need to do to get this method working.

        # You'll need a class variable, let's call it @@genres, that is equal to an empty array (see above).
        # Your #initialize method should add the genre of the song being created to the @@genres array. 
        # All genres should be added to the array. 
        # Control for duplicates when you code your .genres class method (unique genres), 
        # not when you add genres to the original @@genres array. 
        # We will want to know how many songs of each genre have been created. 
        # We'll revisit that job a little later on.

    def self.genres
      @@genres.uniq #This class method is accessed above by the class variable @@genres
    end

    # We also need our Song class to be able to keep track of the number of songs of each genre it creates.
    # In other words, calling: Song.genre_count
  
    # Write a class method, .genre_count, that returns a hash in which the keys are the names of each genre. 
    # Each genre name key should point to a value that is the number of songs that have that genre.
            #Song.genre_count
                # => {"rap" => 5, "rock" => 1, "country" => 3}
    # This manner of displaying numerical data is called a histogram. 
    # How will you create your histogram? You will need to iterate over the @@genres array 
    # and populate a hash with the key/value pairs. 
    # You will need to check to see if the hash already contains a key of a particular genre. 
    # If so, increment the value of that key by one, otherwise, create a new key/value pair.
    
    def self.genre_count
      genre_count = {}
      @@genres.each do |genre|
        if genre_count[genre]
          genre_count[genre] += 1 
        else
          genre_count[genre] = 1
        end
      end
      genre_count
    end

    # Lastly, we want our Song class to reveal to us the number of songs each artist is responsible for (Song.artist_count).

    # Write a class method, .artist_count, that returns a histogram similar to the one above, but for artists rather than genres.
    
    def self.artist_count
        artist_count = {}
        @@artists.each do |artist|
          if artist_count[artist]
            artist_count[artist] += 1 
          else
            artist_count[artist] = 1
          end
        end
        artist_count
      end

  end
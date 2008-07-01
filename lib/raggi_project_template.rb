module RaggiProjectTemplate
  
  # The base require path to your application or library.
  Path = File.basename(__FILE__, File.extname(__FILE__))

  # Add file base-names to this array, and they will be auto-loaded based on 
  # the snake to camel case conversion of the name.
  Autoloads = %w[]

  Autoloads.each do |lib|
    const_name = lib.split(/_/).map{ |s| s.capitalize }.join
    autoload const_name, File.join(Path, lib)
  end

end
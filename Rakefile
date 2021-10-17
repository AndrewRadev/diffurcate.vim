task :default do
  sh 'rspec spec'
end

desc "Prepare archive for deployment"
task :archive do
  sh 'zip -r ~/diffurcate.zip autoload/ doc/diffurcate.txt plugin/'
end

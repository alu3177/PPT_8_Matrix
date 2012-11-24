$:.unshift File.dirname(__FILE__) + 'lib'

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new
task :default => :spec

desc "Ejecuta los tests con --format documentation"
task :tdoc do
    sh "rspec spec/matrix_spec.rb --format documentation"
end

desc "Ejecuta el programa que usa las clases Matriz"
task :bin do
    sh "ruby -Ilib bin/matriz_main.rb"
end

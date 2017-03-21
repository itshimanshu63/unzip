require 'rubygems'
require 'zip'

module OO
  class Unzip

      def folder_exist?(input_zip_folder)
        File.exist? (input_zip_folder)
      end

      def extract(input_zip_folder, destination)
        Chef::Log.info "The input zip file is #{input_zip_folder}"

        Zip::File.open(input_zip_folder) do |unzip_file|
          unzip_file.each do |file|
            file_path = File.join(destination, file.name)
            Chef::Log.info "Trying to unzip #{file} and #{File.exist?(file_path)}"
            FileUtils.mkdir_p(File.dirname(file_path))
            unzip_file.extract(file, file_path) unless File.exist?(file_path)
          end
        end
    end
  end
end

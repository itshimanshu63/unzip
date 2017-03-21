def whyrun_supported?
   true
end

def load_current_resource
  @current_resource = new_resource.class.new(new_resource.name)
  @unzip = OO::Unzip.new
end

action :extract do
  if @unzip.folder_exist?(new_resource.zip_file_path)
    @unzip.extract(new_resource.zip_file_path, new_resource.output_folder)
    Chef::Log.info "File Unzipped to #{new_resource.output_folder}"
    new_resource.updated_by_last_action(true)
  else
    Chef::Log.info "Zip file #{new_resource.zip_file_path} does not exist"
  end
end

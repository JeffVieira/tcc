json.array!(@work_processes) do |work_process|
  json.extract! work_process, :id, :name
  json.url work_process_url(work_process, format: :json)
end

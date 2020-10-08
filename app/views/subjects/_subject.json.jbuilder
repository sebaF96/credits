json.extract! subject, :id, :code, :name, :credits, :year, :passed, :qualification, :created_at, :updated_at
json.url subject_url(subject, format: :json)

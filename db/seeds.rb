dpwh = Department.find_or_create_by!(name: "Department of Public Works and Highways") do |d|
  d.location = "Bonifacio Drive, Port Area, Manila"
end

Teacher.find_or_create_by!(name: "Robert Downey Jr.") do |t|
  t.specialization = "Iron Man"
  t.email = "robert-downey-jr@example.com"
  t.department = dpwh
end

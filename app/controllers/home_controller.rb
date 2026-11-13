class HomeController < ApplicationController
  def index
    @student_count = Student.count
    @teacher_count = Teacher.count
    @subject_count = Subject.count
    @department_count = Department.count
    @recent_activities = PaperTrail::Version.order(created_at: :desc).limit(10)

    # Faculty members for the sidebar roster matching the dashboard design
    @faculty_members = [
      {
        name: "Delle Cris",
        initials: "DC",
        avatar_bg: "#EA580C",
        verified: true,
        role: "Software Development",
        tag1: "Lead",
        tag1_class: "badge-tag-lead",
        tag2: "Office: Lab 301",
        record: Teacher.find_by("name LIKE ?", "%Delle Cris%")
      },
      {
        name: "Fiona Villara",
        initials: "FV",
        avatar_bg: "#0284C7",
        verified: false,
        role: "Application Development",
        tag1: "Instructor",
        tag1_class: "badge-tag-instructor",
        tag2: "Office: Lab 102",
        record: Teacher.find_by("name LIKE ?", "%Fiona Villara%")
      },
      {
        name: "Karla Sobrevilla",
        initials: "KS",
        avatar_bg: "#059669",
        verified: false,
        role: "Embedded Systems & IoT",
        tag1: "Researcher",
        tag1_class: "badge-tag-researcher",
        tag2: "Office: Robotics Lab",
        record: Teacher.find_by("name LIKE ?", "%Karla Sobrevilla%")
      },
      {
        name: "Dr. Aris Thorne",
        initials: "AT",
        avatar_bg: "#8B5CF6",
        verified: false,
        role: "Cybersecurity & Networks",
        tag1: "Professor",
        tag1_class: "badge-tag-professor",
        tag2: "Office: Security Center",
        record: Teacher.find_by("name LIKE ?", "%Thaya%") || Teacher.order(:id).offset(3).first
      }
    ]
  end
end

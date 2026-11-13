class NewStudentNotifier < Noticed::Event
  notification_methods do
    def message
      if params && params[:student_name].present?
        "#{params[:student_name]} (#{params[:program]}) joined #{params[:department_name]}"
      else
        "New student enrollment"
      end
    end
  end
end
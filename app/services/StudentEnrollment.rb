
class StudentEnrollment
  def self.has_taken?(course1,p1)
    flag=false
    p1.courses.each do |course|
      if(course==course1)
        flag=true
      end
    end
    return flag
  end
end
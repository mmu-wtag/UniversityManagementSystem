# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    if user.type=="Admin"
      can :manage, Teacher
      can :manage, Student
      can :manage, Department
      can :manage, Course
    end
    if user.type=="Teacher"
      can :read, Teacher
      can :details, Teacher
      cannot :show, Teacher

      can :read, Student
      can :details, Student
      cannot :show, Student

      can :read, Department
      can :details, Department
      cannot :show, Department

      can :read, Course
      can :details, Course
      cannot :show, Course

    end

    if user.type=="Student"
      can :read, Teacher
      can :details, Teacher
      cannot :show, Teacher

      can :read, Student
      can :details, Student
      cannot :show, Student

      can :manage, TakenCourse

      can :read, Department
      can :details, Department
      cannot :show, Department

      can :read, Course
      can :details, Course
      can :show, Course

    end

  end
end


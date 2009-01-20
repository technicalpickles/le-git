module GitHub
  class User
    include HappyMapper

    tag "user" # TODO report that namespaced classes fail here

    element :company,   String
    element :name,      String
    element :blog,      String
    element :email,     String
    element :location,  String 
    element :login,     String

    has_many :repositories, Repository
  end
end

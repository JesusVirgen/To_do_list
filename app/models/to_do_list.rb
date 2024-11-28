class ToDoList < ApplicationRecord
    validates :title, presence: :true

    enum priority: { Low: 0, Medium: 1, High: 2 }
    enum statuses: { Pending: 0, In_progress: 1, Completed: 2, Canceled: 3 }
    enum category: { Work: 0, House: 1, Shopping: 3, Others: 4 }
end

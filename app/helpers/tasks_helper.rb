module TasksHelper
    def status_with_icon(status)
        case status
        when "Pending"
            content_tag(:span, '⏳ Pending', class: 'badge badge-pending')
        when "In_progress"
            content_tag(:span, '🔨 In progress', class: 'badge badge-in-progress')
        when "Completed"
            content_tag(:span, '✅ Completed', class: 'badge badge-completed')
        when "Canceled"
            content_tag(:span, '❌ Canceled', class: 'badge badge-canceled')
        else
            content_tag(:span, status, class: 'badge badge-default')
        end
    end

    def category_with_icon(category)
        case category
        when "Work"
            content_tag(:span, '💼 Work', class: 'badge badge-work')
        when "House"
            content_tag(:span, '🏠 House', class: 'badge badge-house')
        when "Shopping"
            content_tag(:span, '🛒 Shopping', class: 'badge badge-shopping')
        when "Others"
            content_tag(:span, '📂 Others', class: 'badge badge-others')
        else
            content_tag(:span, category, class: 'badge badge-default')
        end
    end
end
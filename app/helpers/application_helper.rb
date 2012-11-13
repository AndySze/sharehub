module ApplicationHelper
  def error_messages_for( object )
    render(:partial => 'shared/error_messages', :locals => {object:object})
  end

  def timeago(time, options = {})
    options[:class]
    options[:class] = options[:class].blank? ? "timeago" : [options[:class],"timeago"].join(" ")
    content_tag(:span, "", options.merge(:title => time.iso8601)) if time
  end

end

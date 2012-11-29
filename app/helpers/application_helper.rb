module ApplicationHelper
  def error_messages_for( object )
    render(:partial => 'shared/error_messages', :locals => {object:object})
  end

  def timeago(time, options = {})
    options[:class]
    options[:class] = options[:class].blank? ? "timeago" : [options[:class],"timeago"].join(" ")
    content_tag(:span, "", options.merge(:title => time.iso8601)) if time
  end


  #set the description for the page
  def description(page_description)
    content_for(:description) do
      "<meta name=\"description\" content=\"#{page_description}\" />\n"
    end
  end
  #set the keywords for the page
  def keywords(page_keywords)
    content_for(:keywords) do
      "<meta name=\"keywords\"  content=\"#{page_keywords}\" />\n"
    end
  end

end

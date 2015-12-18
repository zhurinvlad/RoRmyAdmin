module ApplicationHelper

  def format_value(value)
    case value
    when String then truncate(value, :length => 40)
    else
      value
    end
  end
end
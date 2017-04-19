module StoreHelper
  def number_to_currency(number, options= {:unit => "KSh", :delimiter => ",", :separator => "."})
    Object.new.extend(ActionView::Helpers::NumberHelper).number_to_currency(number, options)
  end
end

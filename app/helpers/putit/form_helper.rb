module Putit
  module FormHelper
  end
  module FormBuilder
    def upload_select(method, options = {})
      val = @object.send(method.to_s + '_url')
      @template.render(:partial => 'putit/uploader', :locals => { :f => self, :method => method, :val => val, :options => options })
    end
  end

  class ActionView::Helpers::FormBuilder
    include(FormBuilder)
  end
end

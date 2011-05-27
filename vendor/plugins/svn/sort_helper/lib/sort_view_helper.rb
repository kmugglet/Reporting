require 'action_view'

module ActionView
  module Helpers    
    module SortHelper  
      def sort_link(column, caption = nil, association = nil)
        key, order, ses_association = session[@sort_name][:key], session[@sort_name][:order], session[@sort_name][:association]
        if key == column && association == ses_association
          if order.downcase == 'asc'
            icon = 'sort_asc.png'
            order = 'desc'
          else
            icon = 'sort_desc.png'
            order = 'asc'
          end
        else
          icon = nil
          order = 'asc'
        end
        caption = titleize(Inflector::humanize(column)) unless caption
        params = {:params => {:sort_key => column, :sort_order => order, :association => association}}
        link_to(caption, params) + (icon ? nbsp(2) + image_tag(icon) : '')
      end

      def sort_header_tag(column, options = {})
        association = nil    
        if options[:association]
          association = options[:association]
          options.delete(:association)
        end 
        if options[:caption]
          caption = options[:caption]
          options.delete(:caption)
        else
          caption = titleize(Inflector::humanize(column))
        end
        options[:title]= "Sort by #{caption}" unless options[:title]
        content_tag('th', sort_link(column, caption, association), options)
      end

      private
        # Return n non-breaking spaces.
        def nbsp(n)
          '&nbsp;' * n
        end

        # Return capitalized title.
        def titleize(title)
          title.split.map {|w| w.capitalize }.join(' ')
        end
    
        def check_association_not_null
          session[@sort_name][:association] = session[@sort_name][:association] ? session[@sort_name][:association] : sort_default[:association]
        end
    end
  end
end

ActionView::Base.class_eval do
  include ActionView::Helpers::SortHelper
end
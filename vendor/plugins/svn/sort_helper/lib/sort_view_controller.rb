module Sort
  def sort_init(default_key, default_order='asc',name =nil, default_tablename = nil, is_associated = false)
    @sort_name = name || params[:controller] + '_sort'
    @sort_default = {:key => default_key, :order => default_order, :association => default_tablename}
    @is_associated = is_associated
  end

  def sort_update
    if params[:sort_key]
      sort = {:key => params[:sort_key], :order => params[:sort_order], :association => params[:association]}
    elsif session[@sort_name]
      sort = session[@sort_name]   
    else
      sort = @sort_default    
    end
    session[@sort_name] = sort
  end

  def sort_clause
    if @is_associated
      check_association_not_null
       %{#{session[@sort_name][:association]}.#{session[@sort_name][:key]} #{session[@sort_name][:order]}}
    else
       %{#{session[@sort_name][:key]} #{session[@sort_name][:order]}}
    end
  end
end

ActionController::Base.class_eval do
  include Sort
end
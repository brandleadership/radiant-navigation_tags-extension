# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class NavigationTagsExtension < Radiant::Extension
  version "2.0"
  description "Makes building navigations much easier."
  url "http://yourwebsite.com/navigation_tags"
  
  # define_routes do |map|
  #   map.connect 'admin/navigation_tags/:action', :controller => 'admin/navigation_tags'
  # end
  
  define_routes do |map|
    map.namespace :admin, :member => { :remove => :get } do |admin|
      admin.resources :navigation_types
    end
  end
  
  def activate
    Page.send :include, NavigationTags
    admin.nav[:content] << admin.nav_item("Navigation Type", "/admin/navigation_types")
    admin.page.edit.add :form_bottom, "navigation_type", :before => 'edit_buttons'
  end
  
  def deactivate
    # admin.tabs.remove "Navigation Tags"
  end
  
end

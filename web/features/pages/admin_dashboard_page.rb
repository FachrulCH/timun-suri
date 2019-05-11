class AdminDashbordPage < SitePrism::Page
    set_url "/po-admin/admin.php"
  
    element :side_menu,'#sidebar-menu'
end
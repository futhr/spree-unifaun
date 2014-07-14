Deface::Override.new(virtual_path:  'spree/admin/shared/_configuration_menu',
                     name:          'unifaun_admin_configurations_menu',
                     insert_bottom: '[data-hook="admin_configurations_sidebar_menu"], #admin_configurations_sidebar_menu[data-hook]',
                     text:          '<%= configurations_sidebar_menu_item Spree.t(:settings, scope: :unifaun), edit_admin_unifaun_settings_path %>',
                     disabled:      false)

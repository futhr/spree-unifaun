Deface::Override.new(virtual_path:  'spree/admin/shared/_order_tabs',
                     name:          'add_shipments_tab',
                     insert_bottom: '[data-hook="admin_order_tabs"]',
                     partial:       'spree/admin/shared/shipments_tab')

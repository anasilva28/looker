- dashboard: dashboard_analiseartigos
  title: Dashboard Analiseartigos
  layout: tile
  tile_size: 100

  filters:

  elements:
      - name: visualizacao3
        title: Análise de artigos
        model: anaritasilva_proj3
        explore: order_items
        type: looker_column
        fields: [order_items.created_year, inventory_items.product_category, order_items.count]
        pivots: [inventory_items.product_category]
        fill_fields: [order_items.created_year]
        filters:
          inventory_items.product_category: Accessories,Jeans,Shorts,Sweaters
        #sorts: [order_items.created_year, inventory_items.product_category 0]
        sorts: [order_items.created_year 0]
        limit: 5
        column_limit: 50
        query_timezone: America/Los_Angeles
        stacking: normal
        show_value_labels: false
        label_density: 25
        legend_position: center
        x_axis_gridlines: false
        y_axis_gridlines: true
        show_view_names: true
        point_style: none
        series_types: {}
        limit_displayed_rows: false
        y_axis_combined: true
        show_y_axis_labels: true
        show_y_axis_ticks: true
        y_axis_tick_density: default
        y_axis_tick_density_custom: 5
        show_x_axis_label: true
        show_x_axis_ticks: true
        x_axis_scale: auto
        y_axis_scale_mode: linear
        x_axis_reversed: false
        y_axis_reversed: false
        plot_size_by_field: false
        ordering: none
        show_null_labels: false
        show_totals_labels: false
        show_silhouette: false
        totals_color: "#808080"

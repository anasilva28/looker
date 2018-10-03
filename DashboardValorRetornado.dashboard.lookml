- dashboard: dashboardvalorretornado
  title: Dashboardvalorretornado
  layout: tile
  tile_size: 200

  filters:
    - name: Data da Encomenda
      title: Data da Encomenda
      type: date_filter
      default_value: 7 days
      allow_multiple_values: true
      required: false

    - name: Marca do Produto
      title: Marca do Produto
      type: field_filter
      default_value: ''
      allow_multiple_values: true
      required: false
      model: anaritasilva_proj3
      explore: order_items
      listens_to_filters: []
      field: inventory_items.product_brand

  elements:
    - name: visualizacao_valor_retornado
      title: Valor retornado em artigos devolvidos
      model: anaritasilva_proj3
      explore: order_items
      type: looker_area
      fields: [order_items.valor_total_returnado, order_items.created_date]
      fill_fields: [order_items.created_date]
      filters:
       order_items.created_date: 7 days
      sorts: [order_items.created_date desc]
      limit: 500
      query_timezone: America/Los_Angeles
      stacking: ''
      colors: ["#62bad4", "#a9c574", "#929292", "#9fdee0", "#1f3e5a", "#90c8ae", "#92818d",
        "#c5c6a6", "#82c2ca", "#cee0a0", "#928fb4", "#9fc190"]
      show_value_labels: false
      label_density: 25
      legend_position: center
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: true
      point_style: none
      series_colors: {}
      series_types: {}
      limit_displayed_rows: false
      y_axes: [{label: Valor Retornado, orientation: left, series: [{id: order_items.valor_total_returnado,
              name: Order Items Valor Total Returnado, axisId: order_items.valor_total_returnado}],
          showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
          tickDensityCustom: 5, type: linear}]
      y_axis_combined: true
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      x_axis_label: Semana
      show_x_axis_ticks: true
      x_axis_scale: auto
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      plot_size_by_field: false
      reference_lines: [{reference_type: line, line_value: mean, range_start: max, range_end: min,
          margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
          color: "#000000"}]
      show_null_points: true
      interpolation: linear
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
     # listen:
     #   Data da Encomenda: order_items.created_date
      #listen:
       # Data da Encomenda: order_items.created_date
      #  Marca do Produto: inventory_items.product_brand

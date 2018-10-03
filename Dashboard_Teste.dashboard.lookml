- dashboard: Dashboard_Teste
  title: Dashboard Teste
  layout: tile
  tile_size: 100
  elements:
  - title: Valor retornado em artigos devolvidos
    name: Valor retornado em artigos devolvidos
    model: anaritasilva_proj3
    explore: order_items
    type: looker_area
    fields:
    - order_items.valor_total_returnado
    - order_items.created_date
    fill_fields:
    - order_items.created_date
    filters:
      order_items.created_date: 30 days
    listen:
    Data da Encomenda: inventory_items.created_date
    sorts:
    - order_items.created_date desc
    limit: 500
    query_timezone: America/Los_Angeles
    stacking: ''
    colors:
    - "#62bad4"
    - "#a9c574"
    - "#929292"
    - "#9fdee0"
    - "#1f3e5a"
    - "#90c8ae"
    - "#92818d"
    - "#c5c6a6"
    - "#82c2ca"
    - "#cee0a0"
    - "#928fb4"
    - "#9fc190"
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
    y_axes:
    - label: Valor Retornado
      orientation: left
      series:
      - id: order_items.valor_total_returnado
        name: Order Items Valor Total Returnado
        axisId: order_items.valor_total_returnado
        __FILE: anaritasilva_proj3/Dashboard_Teste.dashboard.lookml
        __LINE_NUM: 96
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: anaritasilva_proj3/Dashboard_Teste.dashboard.lookml
      __LINE_NUM: 96
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
    reference_lines:
    - reference_type: line
      line_value: mean
      range_start: max
      range_end: min
      margin_top: deviation
      margin_value: mean
      margin_bottom: deviation
      label_position: right
      color: "#000000"
      __FILE: anaritasilva_proj3/Dashboard_Teste.dashboard.lookml
      __LINE_NUM: 113
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    row:
    col:
    width: 7
    height: 4
  - title: Estado das Encomendas
    name: Estado das Encomendas
    model: anaritasilva_proj3
    explore: order_items
    type: looker_column
    fields:
    - order_items.created_date
    - order_items.count
    - order_items.status
    pivots:
    - order_items.status
    fill_fields:
    - order_items.created_date
    filters:
      order_items.created_date: 30 days
    listen:
    Data da Encomenda: inventory_items.created_date
    sorts:
    - order_items.created_date desc
    - order_items.status
    limit: 500
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
    hidden_series: []
    y_axes:
    - label: Estado da Encomenda
      orientation: left
      series:
      - id: Cancelled - order_items.count
        name: Cancelled
        axisId: order_items.count
        __FILE: anaritasilva_proj3/Dashboard_Teste.dashboard.lookml
        __LINE_NUM: 39
      - id: Complete - order_items.count
        name: Complete
        axisId: order_items.count
        __FILE: anaritasilva_proj3/Dashboard_Teste.dashboard.lookml
        __LINE_NUM: 40
      - id: Processing - order_items.count
        name: Processing
        axisId: order_items.count
        __FILE: anaritasilva_proj3/Dashboard_Teste.dashboard.lookml
        __LINE_NUM: 41
      - id: Returned - order_items.count
        name: Returned
        axisId: order_items.count
        __FILE: anaritasilva_proj3/Dashboard_Teste.dashboard.lookml
        __LINE_NUM: 42
      - id: Shipped - order_items.count
        name: Shipped
        axisId: order_items.count
        __FILE: anaritasilva_proj3/Dashboard_Teste.dashboard.lookml
        __LINE_NUM: 43
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      __FILE: anaritasilva_proj3/Dashboard_Teste.dashboard.lookml
      __LINE_NUM: 39
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Data da Encomenda
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
    row:
    col:
    width: 7
    height: 4

- dashboard: DashboardEstadoEncomendas
  title: Dashboard Teste
  layout: tile
  tile_size: 100
  elements:
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
    filters: {}
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
    listen:
      Data da Encomenda: order_items.created_date
    row:
    col:
    width: 7
    height: 4
  filters:
  - name: Data da Encomenda
    title: Data da Encomenda
    type: date_filter
    default_value: 7 days
    allow_multiple_values: true
    required: false

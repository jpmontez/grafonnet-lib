{
  /**
   * Return a CloudWatch Target
   *
   * @name cloudwatch.target
   *
   * @param region
   * @param namespace
   * @param metric
   * @param datasource
   * @param statistic
   * @param alias
   * @param highResolution
   * @param period
   * @param dimensions

   * @return Panel target
   */

  target(
    region,
    namespace,
    metric,
    datasource=null,
    statistic='Average',
    alias=null,
    highResolution=false,
    period='1m',
    dimensions={},
    hide=false,
    id=null,
    expression=null,
  ):: {
    [if id != null then 'id']: id,
    [if expression != null then 'expression']: expression,
    hide: hide,
    region: region,
    namespace: namespace,
    metricName: metric,
    [if datasource != null then 'datasource']: datasource,
    statistics: if std.type(statistic) == 'array' then statistic else [statistic],
    [if alias != null then 'alias']: alias,
    highResolution: highResolution,
    period: period,
    dimensions: dimensions,
  },
}

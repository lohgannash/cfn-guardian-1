# Alarms for Custom Metrics

when creating alarms from custom metrics you'll need to inherit the Base Alarm template generate the structure of the alarm. The properties can then be overridden in the template.

For example here we are creating an alarm for a disk usage metric generated by the cloudwatch agent on a EC2 instance.

```yaml
Templates:
  CustomMetric:
    # Inherit the base alarm template
    Inherit: Base
    LowDiskSpaceRootVolume:
      # Set the metric namespace
      Namespace: CWAgent
      # Set the metric name
      MetricName: DiskSpaceUsedPercent
      # Set the custom dimentions 
      Dimensions:
        path: '/'
        host: 'my-instance'
        device: 'xvda1'
        fstype: 'ext4'
      # Override the default properties set by the base template
      Statistic: Maximum
      Threshold: 85  
      Period: 60
      EvaluationPeriods: 1
      TreatMissingData: breaching

# create our resource 
Resources:
  CustomMetric:
    - Id: my-instance
```
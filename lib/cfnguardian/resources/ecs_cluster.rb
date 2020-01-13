module CfnGuardian::Resource
  class EcsCluster < Base
    
    def default_alarms    
      alarm = CfnGuardian::Models::EcsClusterAlarm.new(@resource)
      alarm.name = 'CPUUtilizationWarning'
      alarm.metric_name = 'CPUUtilization'
      alarm.alarm_action = 'Warning'
      alarm.statistic = 'Minimum'
      @alarms.push(alarm)
      
      alarm = CfnGuardian::Models::EcsClusterAlarm.new(@resource)
      alarm.name = 'MemoryUtilizationWarning'
      alarm.metric_name = 'MemoryUtilization'
      alarm.alarm_action = 'Warning'
      @alarms.push(alarm)
      
      alarm = CfnGuardian::Models::EcsClusterAlarm.new(@resource)
      alarm.name = 'MemoryUtilizationCritical'
      alarm.metric_name = 'MemoryUtilization'
      alarm.threshold = 90
      @alarms.push(alarm)
      
      alarm = CfnGuardian::Models::EcsClusterAlarm.new(@resource)
      alarm.namespace = 'EcsCICheck'
      alarm.name = 'ECSContianerInstancesDisconnected'
      alarm.metric_name = 'ECSContianerInstancesDisconnected'
      alarm.alarm_action = 'Critical'
      alarm.threshold = 0
      alarm.period = 300
      alarm.evaluation_periods = 2
      @alarms.push(alarm)
    end
    
    def default_events
      @events.push(CfnGuardian::Models::ContainerInstanceEvent.new(@resource))
    end
    
    def default_checks
      @checks.push(CfnGuardian::Models::ContainerInstanceCheck.new(@resource))
    end
    
  end
end
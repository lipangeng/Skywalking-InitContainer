# Skywalking-InitContainer

#### 介绍
在Kubernetes中可用的Skywalking的InitContainer，用于启动应用是从外部挂载Skywalking的Agent。
目前仅支持Java Agent,且默认启用了全部的optional-plugins

#### 软件架构
容器启动时会将/usr/local/skywalking目录下的Java Agent文件拷贝至/opt/skywalking目录之中


#### 安装教程

1.  xxxx
2.  xxxx
3.  xxxx

#### 使用说明

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: demo
spec:
  selector:
    matchLabels:
      name: demo
  template:
    metadata:
      name: demo
      labels:
        name: demo
    spec:
      initContainers:
        - name: skywalking-init
          image: lipangeng/skywalking-initcontainer:7.0.0
          imagePullPolicy: Always
          volumeMounts:
            - mountPath: /opt/skywalking
              name: skywalking
      containers:
        - name: demo
          image: tomcat
          imagePullPolicy: Always
          resources:
            limits:
              memory: 1Gi
          ports:
            - containerPort: 8080
              name: http
              protocol: TCP
          env:
            - name: TZ
              value: Asia/Shanghai
            - name: JAVA_TOOL_OPTIONS
              value: -javaagent:/opt/skywalking/skywalking-agent.jar
            - name: SW_AGENT_NAME
              value: demo
            - name: SW_AGENT_COLLECTOR_BACKEND_SERVICES
              value: skywalking-aop.skywalking:11800
          volumeMounts:
            - mountPath: /opt/skywalking
              name: skywalking
      volumes:
        - name: skywalking
          emptyDir: {}
```
#### 参与贡献

1.  Fork 本仓库
2.  新建 Feat_xxx 分支
3.  提交代码
4.  新建 Pull Request


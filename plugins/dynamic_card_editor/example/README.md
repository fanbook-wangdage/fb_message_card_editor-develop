# Fanbook官方原版，彻底去除登录  

在Netlify上部署的web版：https://card.wdg.cloudns.ch/#/home  

## 常见问题  

### 消息卡片json不能用  

消息卡片需要放置在消息体上，你需要添加下方json的content值为你复制的卡片json  

```json
{"type":"task","content":}
```

然后编码为json字符串，比如说：

```python
json.dumps({"type":"task","content":{"type":"column","children":[{"type":"title","param":{"text":"我是标题"}},{"type":"text","param":{"text":"我是文本","line":1}},{"type":"image","param":{"image":"https://img01.yzcdn.cn/upload_files/2021/11/17/FpoZQu-SN7E8YcSvOpaAZwDUrX8Y.jpg!large.jpg","type":2}}]}})
```  

然后作为text参数  

### json参数描述在哪里寻找  

`plugins\dynamic_card_editor\lib\widget_nodes`下是参数定义，本来应该在编辑器显示，但是目前编辑时不会显示字段提示  

### 模板及组件在哪里定义

`assets\json`下是模板及组件  

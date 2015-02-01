
========================================================

This is an R Markdown document. Markdown is a simple formatting syntax for authoring web pages (click the **Help** toolbar button for more details on using R Markdown).

When you click the **Knit HTML** button a web page will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:


```r
library(RCurl)
```

```
## Loading required package: bitops
```

```r
library (ggplot2)
```

```r
# df1
df_cust <- data.frame(eval(parse(text=substring(getURL(URLencode('http://129.152.144.84:5001/rest/native/?query="select * from customers"'), httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDB1.usuniversi01134.oraclecloud.internal', USER='DV_ORDERS', PASS='orcl', MODE='native_mode', MODEL='model', returnFor = 'R', returnDimensions = 'False'), verbose = TRUE), 1, 2^31-1))))
head(df_cust)
```

```
## data frame with 0 columns and 0 rows
```

```r
# plot1 for df_cust
ggplot (df_cust, aes(x = CUSTOMER_STATE, y = CUSTOMER_LAST_NAME)) + geom_point()
```

```
## Error in eval(expr, envir, enclos): object 'CUSTOMER_STATE' not found
```

```r
ggplot (data = df_cust) + geom_histogram(aes(x = CUSTOMER_STATE))
```

```
## Error in eval(expr, envir, enclos): object 'CUSTOMER_STATE' not found
```

```r
#df2
df_orders <- data.frame(eval(parse(text=substring(getURL(URLencode('http://129.152.144.84:5001/rest/native/?query="select * from orders"'), httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDB1.usuniversi01134.oraclecloud.internal', USER='DV_ORDERS', PASS='orcl', MODE='native_mode', MODEL='model', returnFor = 'R', returnDimensions = 'False'), verbose = TRUE), 1, 2^31-1))))
head(df_orders)
```

```
## data frame with 0 columns and 0 rows
```

```r
# plot2 for df_orders
ggplot(df_orders, aes(x = CUSTOMER_ID, y = ORDER_ID, color = CUSTOMER_ID)) + geom_point()
```

```
## Error in eval(expr, envir, enclos): object 'CUSTOMER_ID' not found
```

```r
#df3
df_ord_details <- data.frame(eval(parse(text=substring(getURL(URLencode('http://129.152.144.84:5001/rest/native/?query="select * from order_details"'), httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDB1.usuniversi01134.oraclecloud.internal', USER='DV_ORDERS', PASS='orcl', MODE='native_mode', MODEL='model', returnFor = 'R', returnDimensions = 'False'), verbose = TRUE), 1, 2^31-1))))

#plot3
ggplot(df_ord_details, aes(x = ITEM_ID, y = ORDER_QTY)) + geom_point() + scale_x_discrete(breaks=df_ord_details$ITEM_ID)
```

```
## Error in eval(expr, envir, enclos): object 'ITEM_ID' not found
```

```r
#hist(df_ord_details$ITEM_ID)

#df4
df_items <- data.frame(eval(parse(text=substring(getURL(URLencode('http://129.152.144.84:5001/rest/native/?query="select * from items"'), httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDB1.usuniversi01134.oraclecloud.internal', USER='DV_ORDERS', PASS='orcl', MODE='native_mode', MODEL='model', returnFor = 'R', returnDimensions = 'False'), verbose = TRUE), 1, 2^31-1))))

#plot4
ggplot(df_items, aes(x = ITEM_ID, y = UNIT_PRICE, color = ARTIST)) + geom_point() + scale_x_discrete(breaks = df_items$ITEM_ID)
```

```
## Error in eval(expr, envir, enclos): object 'ITEM_ID' not found
```

```r
df_main <- df <- data.frame(eval(parse(text=substring(getURL(URLencode('http://129.152.144.84:5001/rest/native/?query="select * from orders o join customers c on o.customer_id = c.customer_id join order_details d on o.order_id = d.order_id join items i on d.item_id = i.item_id"'), httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDB1.usuniversi01134.oraclecloud.internal', USER='DV_ORDERS', PASS='orcl', MODE='native_mode', MODEL='model', returnFor = 'R', returnDimensions = 'False'), verbose = TRUE), 1, 2^31-1))))

# plot1 based on UP
ggplot(df_main, aes(x = as.Date(ORDER_DATE,"%Y-%m-%d"), y = as.Date(SHIPPED_DATE,"%Y-%m-%d"), color = as.factor(UNIT_PRICE)) ) + geom_point() + facet_wrap(~CUSTOMER_STATE)
```

```
## Error in layout_base(data, vars, drop = drop): At least one layer must contain all variables used for facetting
```

```r
# plot2 based on TITLE
ggplot(df_main, aes(x = as.Date(ORDER_DATE,"%Y-%m-%d"), y = as.Date(SHIPPED_DATE,"%Y-%m-%d"), color = as.factor(TITLE)) ) + geom_point() + facet_wrap(~CUSTOMER_STATE)
```

```
## Error in layout_base(data, vars, drop = drop): At least one layer must contain all variables used for facetting
```

```r
# plot3 based on ARTIST
ggplot(df_main, aes(x = as.Date(ORDER_DATE,"%Y-%m-%d"), y = as.Date(SHIPPED_DATE,"%Y-%m-%d"), color = as.factor(ARITIST)) ) + geom_point() + facet_wrap(~CUSTOMER_STATE)
```

```
## Error in layout_base(data, vars, drop = drop): At least one layer must contain all variables used for facetting
```

```r
plot(cars)
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3-1.png) 


# Big Number Multiplication x86 Assembly

> 独立完成部分。

## 实验要求

### 命令行 CLI

大数相乘：要求实现两个十进制大整数的相乘（100 位以上），输出乘法运算的结果。

### GUI 图形界面

结合 Windows 界面编程，实现完善的计算器功能，支持浮点运算和三角函数等功能。

### 要求

独立完成部分要求每位同学独立完成并撰写实验报告（Word/PDF 版本），格式参照教务处本科毕业论文格式，报告最后一部分阐述课程学习体会及意见与建议。

## 构建方式

项目在 Windows 10 上，利用 MASM 构建。需要 Visual Studio 环境和 MASM 编译器。

- 使用 Visual Studio 2019 打开 `BigNumMultiply.sln` 项目
- 打开菜单 `Build dependencies > Build Customizations`

<img src="https://i.loli.net/2019/05/03/5ccc4100e6135.png" width="1387px">

- 并勾选 `masm`

<img src="https://i.loli.net/2019/05/03/5ccc4100e1ec1.png" width="901px">

- 在 `Properties` > `Linker` 处添加 MASM 库的地址：`...\masm32\lib`

<img src="https://i.loli.net/2019/05/03/5ccc410120c76.png" width="1574px">

- 执行项目即可
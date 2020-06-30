# iOS - Undefined symbol

错误信息

```
Undefined symbol: _vDSP_vclip

Undefined symbol: _vDSP_vsadd

Undefined symbol: _vvexpf

Undefined symbol: _vDSP_sve

Undefined symbol: _vDSP_mmul

Undefined symbol: _vDSP_maxv

Undefined symbol: _vDSP_dotpr

Undefined symbol: _vDSP_vsdiv
```

解决方法：添加系统库 `Accelerate.framework`

相关文章：<https://www.jianshu.com/p/c219aba30053>

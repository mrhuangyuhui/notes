# Laravel - Pipeline

```php
<?php

// ************************************************************************************************************** //
// "洋葱式"管线的简化实现
// ************************************************************************************************************** //

// 假设管线有 3 层管道

// 管线的第 1 层管道
$pipe1 = function ($piped, $next) {
    // 前置处理
    $piped = $piped . '->pipe1_forward->';
    // 传递给下一层管道继续处理
    $piped = $next($piped);
    // 后置处理
    $piped = $piped . '->pipe1_backward';
    return $piped;
};

// 管线的第 2 层管道
$pipe2 = function ($piped, $next) {
    // 前置处理
    $piped = $piped . '->pipe2_forward->';
    // 处理结果传递给下一层管道
    $piped = $next($piped);
    // 后置处理
    $piped = $piped . '->pipe2_backward->';
    return $piped;
};

// 管线的核心层管道
$core = function ($piped) {
    // 核心处理
    $piped = $piped . '->[CORE]->';
    // 前置层->核心层的处理结果传递给后置层继续处理
    return $piped;
};

// 注意："洋葱式"管线按"从内到外"的顺序进行组装

// 按"从内到外"的顺序摆放好管道，等待组装。
$array = array_reverse([$pipe1, $pipe2]);

if (false) {
    // ************************************************************************************************************** //
    // 组装方式一：手动组装
    // ************************************************************************************************************** //

    // 步骤 1：组装管线的核心层管道
    $pipeline = function ($passable) use ($core) {
        return $core($passable);
    };

    // 步骤 2：组装管线的第 2 层管道
    $pipeline = function ($passable) use ($pipeline, $pipe2) {
        return $pipe2($passable, $pipeline);
    };

    // 步骤 3：组装管线的第 1 层管道
    $pipeline = function ($passable) use ($pipeline, $pipe1) {
        return $pipe1($passable, $pipeline);
    };
} else {
    // ************************************************************************************************************** //
    // 组装方式 2：自动组装，使用函数 array_reduce
    // ************************************************************************************************************** //

    // 管线的组装规则
    $callback = function ($carry, $item) {
        return function ($passable) use ($carry, $item) {
            return $item($passable, $carry);
        };
    };

    // 组装管线的核心层管道
    $initial = function ($passable) use ($core) {
        return $core($passable);
    };

    // 组装剩余管道
    $pipeline = array_reduce($array, $callback, $initial);
}


// 输入 'foo'，经过管线加工处理后，输出 "foo->->pipe1_forward->->pipe2_forward->->[CORE]->->pipe2_backward->->pipe1_backward"。
var_dump($pipeline('foo->'));
```

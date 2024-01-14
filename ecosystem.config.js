module.exports = {
    apps : [{
      name: 'wakeup',       // 应用程序名称
      script: 'python3',         // 执行Python解释器
      args: 'wakeup.py',     // Python脚本及其参数
      interpreter: '',           // 不使用任何额外的解释器
      exec_mode: 'fork',         // fork模式
      watch: true,               // 监听文件变化自动重启
      autorestart: true,         // 自动重启
      max_memory_restart: '100M' // 如果超过100MB内存占用则重启应用
    }]
  };
  
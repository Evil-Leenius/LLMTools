
# LLMTools Documentation

## 📖 Table of Contents
1. [Overview](#overview)
2. [Installation & Setup](#installation--setup)
3. [Core Features & Modules](#core-features--modules)
4. [API Reference](#api-reference)
5. [Configuration Options](#configuration-options)
6. [Security Best Practices](#security-best-practices)
7. [Performance Guidelines](#performance-guidelines)
8. [Examples & Usage Scenarios](#examples--usage-scenarios)
9. [Troubleshooting & Debugging](#troubleshooting--debugging)
10. [Future Enhancements](#future-enhancements)

## 1️⃣ Overview
**LLMTools** is a modular, high-performance Swift package that enables seamless integration of LLMs (Large Language Models) into iOS/macOS apps. It supports:

- **Local & Cloud LLM Execution** (OpenAI, Anthropic, Hugging Face, MLX-based models)
- **Tool Use & OS Command Execution** (with security controls)
- **File System Access** (restricted by default)
- **Fine-Tuning & Context Retention**
- **Structured Data Extraction & File Parsing**
- **Performance Optimizations** (GPU acceleration, caching, dynamic token handling)

---

## 2️⃣ Installation & Setup

### Installation with Swift Package Manager (SPM)
```swift
dependencies: [
    .package(url: "https://github.com/your-repo/LLMTools.git", from: "1.0.0")
]
```

Import the package into your project:
```swift
import LLMTools
```

---

## 3️⃣ Core Features & Modules

| **Module** | **Description** |
|------------|----------------|
| `LocalLLMProcessor` | Executes local LLMs using GPU acceleration. |
| `CloudLLMClient` | Interfaces with OpenAI, Anthropic, and other APIs. |
| `ToolManager` | Enables AI to register & execute external scripts. |
| `OSCommandExecutor` | Allows AI to run system commands (restricted by default). |
| `FileSystemManager` | Manages AI-driven file operations within a controlled directory. |
| `FineTuner` | Supports local & cloud-based fine-tuning. |
| `PromptOptimizer` | Reduces token waste and optimizes prompt structure. |
| `StructuredDataExtractor` | Extracts structured information from unstructured text. |
| `ResponseCache` | Caches frequently used AI responses. |

---

## 4️⃣ API Reference

### Local Model Execution
#### Load a Model
```swift
LocalLLMProcessor.shared.loadModel(modelPath: "/models/gpt4.gguf", useGPU: true)
```
#### Run Inference
```swift
let response = LocalLLMProcessor.shared.processInput("Explain quantum mechanics.")
```

### Cloud API Integration
#### OpenAI Execution
```swift
CloudLLMClient.shared.callOpenAI(prompt: "What is the capital of France?", streaming: false) { response in
    print(response)
}
```
#### Anthropic Execution
```swift
CloudLLMClient.shared.callAnthropic(prompt: "Give me a summary of AI ethics.") { response in
    print(response)
}
```

### Secure Tool Execution
```swift
ToolManager.shared.registerTool(name: "PythonScript", executablePath: "/usr/bin/python3")
ToolManager.shared.executeTool(name: "PythonScript", arguments: ["script.py"]) { output in
    print("Tool Output: \(output)")
}
```

### Secure File System Access
```swift
FileSystemManager.shared.configure(rootPath: "/Users/lee/Documents/AI", enableAccess: true)
let content = FileSystemManager.shared.readFile(filename: "data.txt")
print(content)
```

---

## 5️⃣ Configuration Options

| **Setting** | **Default** | **Description** |
|-------------|------------|-----------------|
| `useGPU` | `true` | Enables GPU acceleration for local models. |
| `maxTokens` | `2048` | Dynamically adjusts based on available memory. |
| `enableFileAccess` | `false` | Restricts AI to a predefined directory unless overridden. |
| `enableUnrestrictedOSExecution` | `false` | Allows AI to execute any system command if explicitly enabled. |

---

## 6️⃣ Security Best Practices

- **Restrict OS execution (`OSCommandExecutor.swift`)**
- **Restrict file system access (`FileSystemManager.swift`)**
- **Never log API keys (`ConfigManager.swift`)**
- **Use environment variables for sensitive credentials**
- **Validate AI-generated commands before execution**

---

## 7️⃣ Performance Guidelines

- **Enable GPU Acceleration (`LocalLLMProcessor.swift`)**
- **Use `ResponseCache` to avoid redundant computations**
- **Optimize prompts (`PromptOptimizer.swift`) to reduce token waste**
- **Use batch processing for large inference requests**

---

## 8️⃣ Examples & Usage Scenarios

- **Building an AI-powered chatbot**
- **Automating file analysis & data extraction**
- **Integrating LLM-powered insights into existing macOS/iOS apps**
- **Running local models efficiently with GPU acceleration**

---

## 9️⃣ Troubleshooting & Debugging

### Common Issues & Fixes

| **Issue** | **Possible Cause** | **Fix** |
|-----------|-------------------|---------|
| Model inference is slow | GPU acceleration not enabled | Ensure `useGPU = true` |
| API keys not loading | `Secrets.plist` missing | Ensure API keys are stored securely |
| File access error | Insufficient permissions | Set correct `rootPath` and enable access |
| OS command execution blocked | Restricted by default | Enable `enableUnrestrictedOSExecution = true` (not recommended) |

---

## 🔜 10️⃣ Future Enhancements

- **Expanding model support (Meta AI, Cohere, etc.)**
- **Improving real-time streaming for AI responses**
- **Enhancing fine-tuning with model checkpointing**

---

### 📌 Final Notes
This documentation provides an **in-depth reference for `LLMTools`**, making it easy to integrate LLM capabilities into macOS/iOS projects.


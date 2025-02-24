
# LLMTools Developer Documentation

## 📖 Table of Contents
1. [Overview](#overview)
2. [Core Modules](#core-modules)
3. [API Reference](#api-reference)
4. [Configuration](#configuration)
5. [Security Considerations](#security-considerations)

---

## 1️⃣ Overview

`LLMTools` is a modular Swift package designed to integrate **Local and Cloud-based LLMs (Large Language Models)** into iOS/macOS applications. It supports:

✔ **Local execution with GPU acceleration**  
✔ **Cloud execution with OpenAI, Anthropic, and custom APIs**  
✔ **File system access (secure by default)**  
✔ **Secure tool execution**  
✔ **Fine-tuning and structured data extraction**  

---

## 2️⃣ Core Modules

### **1. `LocalLLMProcessor.swift`**
- Loads and executes local LLM models using **Apple’s MLX framework**.
- Supports **GPU acceleration** for faster inference.

### **2. `CloudLLMClient.swift`**
- Connects to OpenAI, Anthropic, and other cloud-based LLMs.
- Supports **streaming responses**.

### **3. `ModelDownloader.swift`**
- Downloads models from **Hugging Face** and **custom URLs**.

### **4. `ToolManager.swift`**
- Manages AI-driven **external tool execution**.

### **5. `OSCommandExecutor.swift`**
- Allows AI to run **system commands** with **security restrictions**.

### **6. `FileSystemManager.swift`**
- Controls AI-driven **file system operations** within a secure directory.

### **7. `SecureStorage.swift`**
- **Encrypts and stores API keys** securely using AES-256.

---

## 3️⃣ API Reference

### **📌 `LocalLLMProcessor`**

#### **Function: `loadModel(modelPath: String, useGPU: Bool)`**
- **Description:** Loads a local LLM model into memory.
- **Inputs:**  
  - `modelPath: String` – The file path to the model.  
  - `useGPU: Bool` – Whether to enable GPU acceleration.  
- **Output:** None  

🔹 **Example Usage:**  
```swift
LocalLLMProcessor.shared.loadModel(modelPath: "/models/gpt4.gguf", useGPU: true)
```

---

### **📌 `CloudLLMClient`**

#### **Function: `callOpenAI(prompt: String, streaming: Bool, completion: @escaping (String) -> Void)`**
- **Description:** Calls OpenAI’s API with a given prompt.
- **Inputs:**  
  - `prompt: String` – The input text to send.  
  - `streaming: Bool` – Whether to use real-time streaming.  
  - `completion: @escaping (String) -> Void` – Callback function with the response.  
- **Output:** None (response is returned asynchronously).  

🔹 **Example Usage:**  
```swift
CloudLLMClient.shared.callOpenAI(prompt: "What is AI?", streaming: false) { response in
    print(response)
}
```

---

### **📌 `ModelDownloader`**

#### **Function: `downloadModel(provider: ModelProvider, destinationPath: String, completion: @escaping (String) -> Void)`**
- **Description:** Downloads a model from Hugging Face or a custom provider.
- **Inputs:**  
  - `provider: ModelProvider` – Hugging Face or Custom URL.  
  - `destinationPath: String` – Where to save the model.  
  - `completion: @escaping (String) -> Void` – Callback when download finishes.  
- **Output:** None (completion block contains status).  

🔹 **Example Usage:**  
```swift
ModelDownloader.shared.downloadModel(provider: .huggingFace(modelRepo: "meta-llama/Llama-2-7b"), 
                                     destinationPath: "/models/Llama-2-7b.gguf") { result in
    print(result)
}
```

---

### **📌 `SecureStorage`**

#### **Function: `saveAPIKey(service: String, apiKey: String)`**
- **Description:** Encrypts and securely stores an API key.
- **Inputs:**  
  - `service: String` – The name of the API service.  
  - `apiKey: String` – The API key to store.  
- **Output:** None  

🔹 **Example Usage:**  
```swift
SecureStorage.saveAPIKey(service: "OpenAI", apiKey: "sk-xxxxxxx")
```

#### **Function: `getAPIKey(service: String) -> String?`**
- **Description:** Retrieves a previously stored API key.
- **Inputs:**  
  - `service: String` – The name of the API service.  
- **Output:** `String?` (The decrypted API key or `nil` if not found).  

🔹 **Example Usage:**  
```swift
if let openAIKey = SecureStorage.getAPIKey(service: "OpenAI") {
    print("Retrieved API Key: \(openAIKey)")
}
```

---

## 4️⃣ Configuration

### **Environment Variables**
To store API keys securely, set them as environment variables in macOS/Linux:

```bash
export OPENAI_API_KEY="sk-xxxxxxx"
```

Retrieve them in Swift:
```swift
let apiKey = ProcessInfo.processInfo.environment["OPENAI_API_KEY"]
```

---

## 5️⃣ Security Considerations

✔ **Restrict OS execution (`OSCommandExecutor.swift`)**  
✔ **Limit file access (`FileSystemManager.swift`)**  
✔ **Never log API keys (`SecureStorage.swift`)**  
✔ **Use GPU acceleration for secure local processing**  

---

## 🔜 Future Enhancements

✔ **Add support for additional LLM providers (e.g., Cohere, Meta AI).**  
✔ **Enhance real-time streaming capabilities.**  
✔ **Improve local model inference with MLX optimizations.**  

---

### 📌 Final Notes
This documentation provides an **in-depth reference for `LLMTools`**, covering **functionality, security, and best practices**.


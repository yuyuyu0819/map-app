<template>
  <main class="page">
    <h1>APIレスポンス</h1>
    <p class="status">{{ message }}</p>
    <NuxtLink to="/" class="back-link">トップへ戻る</NuxtLink>
  </main>
</template>

<script setup>
const message = ref("読み込み中...")

onMounted(async () => {
  try {
    const response = await fetch("http://localhost:8080/api/hello")
    if (!response.ok) {
      message.value = `エラー: ${response.status}`
      return
    }
    message.value = await response.text()
  } catch (error) {
    message.value = `通信失敗: ${error?.message ?? "不明なエラー"}`
  }
})
</script>

<style scoped>
.page {
  padding: 32px;
  font-family: "Segoe UI", sans-serif;
}

.status {
  margin-top: 12px;
  padding: 12px;
  border-radius: 6px;
  background: #f3f4f6;
}

.back-link {
  display: inline-block;
  margin-top: 16px;
  color: #2563eb;
}
</style>

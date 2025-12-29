<template>
  <main class="page">
    <h1>トップページ</h1>
    <p>APIレスポンス表示ページへ移動します。</p>
    <NuxtLink to="/response" class="button-link">
      <button type="button" class="primary-button">APIレスポンスを見る</button>
    </NuxtLink>
  </main>
</template>

<style scoped>
.page {
  padding: 32px;
  font-family: "Segoe UI", sans-serif;
}

.button-link {
  text-decoration: none;
}

.primary-button {
  margin-top: 16px;
  padding: 12px 20px;
  border: none;
  border-radius: 6px;
  background: #2563eb;
  color: #fff;
  font-size: 16px;
  cursor: pointer;
}

.primary-button:hover {
  background: #1d4ed8;
}
</style>

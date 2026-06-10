// Nama : Tri Panji Utomo
// NIM : 2311102213

<div>
    <div class="mb-4">
        <label class="block text-sm font-medium text-gray-700">Nama Produk</label>
        <input type="text" name="name" value="{{ old('name', $product->name ?? '') }}" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm">
        @error('name') <span class="text-red-500 text-sm">{{ $message }}</span> @enderror
    </div>
    <div class="mb-4">
        <label class="block text-sm font-medium text-gray-700">Deskripsi</label>
        <textarea name="description" rows="3" class="mt-1 block w-full rounded-md border-gray-300">{{ old('description', $product->description ?? '') }}</textarea>
    </div>
    <div class="mb-4">
        <label class="block text-sm font-medium text-gray-700">Harga</label>
        <input type="number" name="price" value="{{ old('price', $product->price ?? '') }}" class="mt-1 block w-full rounded-md border-gray-300">
        @error('price') <span class="text-red-500 text-sm">{{ $message }}</span> @enderror
    </div>
    <div class="mb-4">
        <label class="block text-sm font-medium text-gray-700">Stok</label>
        <input type="number" name="stock" value="{{ old('stock', $product->stock ?? '') }}" class="mt-1 block w-full rounded-md border-gray-300">
        @error('stock') <span class="text-red-500 text-sm">{{ $message }}</span> @enderror
    </div>

    <div class="flex gap-2">
    <button type="submit" class="bg-gray-800 hover:bg-gray-900 text-white px-4 py-2 rounded">
        Simpan
    </button>
    <a href="{{ route('products.index') }}" class="bg-gray-800 hover:bg-gray-900 text-white px-4 py-2 rounded">
        Batal
    </a>
</div>
</div>
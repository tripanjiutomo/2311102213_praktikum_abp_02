// Nama : Tri Panji Utomo
// NIM : 2311102213

<x-app-layout>
    <x-slot name="header">Edit Produk</x-slot>
    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg p-6">
                <form method="POST" action="{{ route('products.update', $product) }}">
                    @csrf @method('PUT')
                    @include('products._form')
                </form>
            </div>
        </div>
    </div>
</x-app-layout>
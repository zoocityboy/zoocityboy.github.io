---
title: Modern Pageable list view for Flutter with Cubit
description: A technique for pageable list views that keeps the UI seamless by paging independently per-row with Cubit-based caching.
layout: post
type: post
date: 2023-08-16
tags:
  - flutter
  - listview
  - cubit
  - bloc
  - pagination
  - performance

---

Seamless user interaction is our goal.

In this article I focus on optimized data loading for ListView — avoiding the typical pause while a "loading" widget appears, and skipping distance counting or brittle viewport math. The approach partitions the list into pages; each page is responsible for loading and caching its own data so the overall ListView can remain responsive and avoid full refreshes.

Inspiration

The idea came from watching the Observable Flutter series with Rémi Rousselet and his Riverpod list implementation. I wanted a similar, performant solution using Cubit/Bloc (we use Bloc at work), so I reimplemented the pattern for Cubit.

Prerequisites

This technique assumes your API supports standard pagination (offset, keyset, or seek pagination). It also assumes a predictable API response shape so we can convert results into a pageable model the Cubit can understand.

Formalization of API responses

Since we want a generic implementation, define a stable pageable model that represents page data and metadata returned by your API. This keeps the Cubit logic decoupled from specific endpoint shapes.

Common pagination styles:

- Offset pagination: `GET /items?limit=20&offset=100`
- Keyset pagination: `GET /items?limit=20&created:lte:2019-01-20T00:00:00`
- Seek pagination: `GET /items?limit=20&after_id=20`

Logic

The implementation uses two cooperating Cubits:

1. `PageableListCubit` — the orchestrator that initializes the first request, tracks pages, and stores a map of page-index → page-cubit/state.
2. Per-page Cubits — each page has a cubit that loads its page independently and caches its state (loading, success with items, error). This separation allows the ListView to update only the visible page widgets instead of forcing a global refresh.

Work with page

- When initializing a page cubit you may pass an initial list of items — this is useful to seed data returned from the first request and avoid duplicate fetching.
- The API request is performed via a callback passed from `PageableListCubit` to each page cubit. After a successful fetch we create per-page cubits and store them in the success state as a map keyed by page index.
- Important: use `BlocProvider.value` when providing per-item cubits to list items so the cubit isn't closed when the item widget disposes — this preserves the cached data for future reuse.

Implementation

At a high level:

- Register a `PageableListCubit` with a loader function that performs the API call and returns the first page and total item information.
- During the initial load, show a Loading List view that renders placeholders (a skeleton) with the same number of items as the `limit` so the UI layout remains stable.
- Each subsequent page is loaded when its corresponding page-cubit becomes visible (e.g., the page widget is built in the ListView), and until data arrives the page shows placeholders.

Images / demo

![Demo of Modern Pageable ListView](https://miro.medium.com/v2/resize:fit:2000/format:webp/1*ChOp1OvB3CWOA33BHKocCQ.gif)

Source code

Sample code and a small repository demonstrating this approach are available on GitHub: https://github.com/zoocityboy/modern_pageable_listview

Thank you for reading!

If I got something wrong, let me know in the comments — I'd love to improve. Special thanks to Felix Angelov and Rémi Rousselet for their work and inspiration.

Original post: https://zoocityboy.medium.com/modern-pageable-list-view-for-flutter-with-cubit-792d52d4e168
